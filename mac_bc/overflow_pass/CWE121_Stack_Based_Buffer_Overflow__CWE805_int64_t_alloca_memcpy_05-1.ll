; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i64*, !dbg !31
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 800, align 16, !dbg !34
  %3 = bitcast i8* %2 to i64*, !dbg !35
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %4, 0, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !39
  store i64* %5, i64** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !48
  %7 = load i64*, i64** %data, align 8, !dbg !49
  %8 = bitcast i64* %7 to i8*, !dbg !49
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !49
  %9 = bitcast i64* %arraydecay to i8*, !dbg !49
  %10 = load i64*, i64** %data, align 8, !dbg !49
  %11 = bitcast i64* %10 to i8*, !dbg !49
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !49
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 800, i64 noundef %12) #5, !dbg !49
  %13 = load i64*, i64** %data, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i64, i64* %13, i64 0, !dbg !50
  %14 = load i64, i64* %arrayidx, align 8, !dbg !50
  call void @printLongLongLine(i64 noundef %14), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_05_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* noundef null), !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 noundef %conv), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_05_good(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_05_bad(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 400, align 16, !dbg !82
  %1 = bitcast i8* %0 to i64*, !dbg !83
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %2 = alloca i8, i64 800, align 16, !dbg !86
  %3 = bitcast i8* %2 to i64*, !dbg !87
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !85
  %4 = load i32, i32* @staticFalse, align 4, !dbg !88
  %tobool = icmp ne i32 %4, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !94
  store i64* %5, i64** %data, align 8, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !99
  %7 = load i64*, i64** %data, align 8, !dbg !100
  %8 = bitcast i64* %7 to i8*, !dbg !100
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !100
  %9 = bitcast i64* %arraydecay to i8*, !dbg !100
  %10 = load i64*, i64** %data, align 8, !dbg !100
  %11 = bitcast i64* %10 to i8*, !dbg !100
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !100
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 800, i64 noundef %12) #5, !dbg !100
  %13 = load i64*, i64** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i64, i64* %13, i64 0, !dbg !101
  %14 = load i64, i64* %arrayidx, align 8, !dbg !101
  call void @printLongLongLine(i64 noundef %14), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 400, align 16, !dbg !109
  %1 = bitcast i8* %0 to i64*, !dbg !110
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %2 = alloca i8, i64 800, align 16, !dbg !113
  %3 = bitcast i8* %2 to i64*, !dbg !114
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !112
  %4 = load i32, i32* @staticTrue, align 4, !dbg !115
  %tobool = icmp ne i32 %4, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !118
  store i64* %5, i64** %data, align 8, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !124
  %7 = load i64*, i64** %data, align 8, !dbg !125
  %8 = bitcast i64* %7 to i8*, !dbg !125
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !125
  %9 = bitcast i64* %arraydecay to i8*, !dbg !125
  %10 = load i64*, i64** %data, align 8, !dbg !125
  %11 = bitcast i64* %10 to i8*, !dbg !125
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !125
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 800, i64 noundef %12) #5, !dbg !125
  %13 = load i64*, i64** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i64, i64* %13, i64 0, !dbg !126
  %14 = load i64, i64* %arrayidx, align 8, !dbg !126
  call void @printLongLongLine(i64 noundef %14), !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 23, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !10, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !9}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 30, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!8 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"Homebrew clang version 14.0.6"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_05_bad", scope: !13, file: !13, line: 28, type: !23, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !{}
!26 = !DILocalVariable(name: "data", scope: !22, file: !13, line: 30, type: !5)
!27 = !DILocation(line: 30, column: 15, scope: !22)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !22, file: !13, line: 31, type: !5)
!29 = !DILocation(line: 31, column: 15, scope: !22)
!30 = !DILocation(line: 31, column: 42, scope: !22)
!31 = !DILocation(line: 31, column: 31, scope: !22)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !22, file: !13, line: 32, type: !5)
!33 = !DILocation(line: 32, column: 15, scope: !22)
!34 = !DILocation(line: 32, column: 43, scope: !22)
!35 = !DILocation(line: 32, column: 32, scope: !22)
!36 = !DILocation(line: 33, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !22, file: !13, line: 33, column: 8)
!38 = !DILocation(line: 33, column: 8, scope: !22)
!39 = !DILocation(line: 37, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !13, line: 34, column: 5)
!41 = !DILocation(line: 37, column: 14, scope: !40)
!42 = !DILocation(line: 38, column: 5, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !13, line: 40, type: !45)
!44 = distinct !DILexicalBlock(scope: !22, file: !13, line: 39, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 40, column: 17, scope: !44)
!49 = !DILocation(line: 42, column: 9, scope: !44)
!50 = !DILocation(line: 43, column: 27, scope: !44)
!51 = !DILocation(line: 43, column: 9, scope: !44)
!52 = !DILocation(line: 45, column: 1, scope: !22)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_05_good", scope: !13, file: !13, line: 94, type: !23, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!54 = !DILocation(line: 96, column: 5, scope: !53)
!55 = !DILocation(line: 97, column: 5, scope: !53)
!56 = !DILocation(line: 98, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 110, type: !58, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!58 = !DISubroutineType(types: !59)
!59 = !{!14, !14, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !13, line: 110, type: !14)
!64 = !DILocation(line: 110, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !13, line: 110, type: !60)
!66 = !DILocation(line: 110, column: 27, scope: !57)
!67 = !DILocation(line: 113, column: 22, scope: !57)
!68 = !DILocation(line: 113, column: 12, scope: !57)
!69 = !DILocation(line: 113, column: 5, scope: !57)
!70 = !DILocation(line: 115, column: 5, scope: !57)
!71 = !DILocation(line: 116, column: 5, scope: !57)
!72 = !DILocation(line: 117, column: 5, scope: !57)
!73 = !DILocation(line: 120, column: 5, scope: !57)
!74 = !DILocation(line: 121, column: 5, scope: !57)
!75 = !DILocation(line: 122, column: 5, scope: !57)
!76 = !DILocation(line: 124, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 52, type: !23, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!78 = !DILocalVariable(name: "data", scope: !77, file: !13, line: 54, type: !5)
!79 = !DILocation(line: 54, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !13, line: 55, type: !5)
!81 = !DILocation(line: 55, column: 15, scope: !77)
!82 = !DILocation(line: 55, column: 42, scope: !77)
!83 = !DILocation(line: 55, column: 31, scope: !77)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !13, line: 56, type: !5)
!85 = !DILocation(line: 56, column: 15, scope: !77)
!86 = !DILocation(line: 56, column: 43, scope: !77)
!87 = !DILocation(line: 56, column: 32, scope: !77)
!88 = !DILocation(line: 57, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !77, file: !13, line: 57, column: 8)
!90 = !DILocation(line: 57, column: 8, scope: !77)
!91 = !DILocation(line: 60, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !13, line: 58, column: 5)
!93 = !DILocation(line: 61, column: 5, scope: !92)
!94 = !DILocation(line: 65, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !13, line: 63, column: 5)
!96 = !DILocation(line: 65, column: 14, scope: !95)
!97 = !DILocalVariable(name: "source", scope: !98, file: !13, line: 68, type: !45)
!98 = distinct !DILexicalBlock(scope: !77, file: !13, line: 67, column: 5)
!99 = !DILocation(line: 68, column: 17, scope: !98)
!100 = !DILocation(line: 70, column: 9, scope: !98)
!101 = !DILocation(line: 71, column: 27, scope: !98)
!102 = !DILocation(line: 71, column: 9, scope: !98)
!103 = !DILocation(line: 73, column: 1, scope: !77)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 76, type: !23, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!105 = !DILocalVariable(name: "data", scope: !104, file: !13, line: 78, type: !5)
!106 = !DILocation(line: 78, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !13, line: 79, type: !5)
!108 = !DILocation(line: 79, column: 15, scope: !104)
!109 = !DILocation(line: 79, column: 42, scope: !104)
!110 = !DILocation(line: 79, column: 31, scope: !104)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !13, line: 80, type: !5)
!112 = !DILocation(line: 80, column: 15, scope: !104)
!113 = !DILocation(line: 80, column: 43, scope: !104)
!114 = !DILocation(line: 80, column: 32, scope: !104)
!115 = !DILocation(line: 81, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !104, file: !13, line: 81, column: 8)
!117 = !DILocation(line: 81, column: 8, scope: !104)
!118 = !DILocation(line: 84, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !13, line: 82, column: 5)
!120 = !DILocation(line: 84, column: 14, scope: !119)
!121 = !DILocation(line: 85, column: 5, scope: !119)
!122 = !DILocalVariable(name: "source", scope: !123, file: !13, line: 87, type: !45)
!123 = distinct !DILexicalBlock(scope: !104, file: !13, line: 86, column: 5)
!124 = !DILocation(line: 87, column: 17, scope: !123)
!125 = !DILocation(line: 89, column: 9, scope: !123)
!126 = !DILocation(line: 90, column: 27, scope: !123)
!127 = !DILocation(line: 90, column: 9, scope: !123)
!128 = !DILocation(line: 92, column: 1, scope: !104)
