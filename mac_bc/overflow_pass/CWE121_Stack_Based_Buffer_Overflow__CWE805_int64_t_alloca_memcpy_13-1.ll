; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13_bad() #0 !dbg !15 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 400, align 16, !dbg !24
  %1 = bitcast i8* %0 to i64*, !dbg !25
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %2 = alloca i8, i64 800, align 16, !dbg !28
  %3 = bitcast i8* %2 to i64*, !dbg !29
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !27
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !30
  %cmp = icmp eq i32 %4, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !34
  store i64* %5, i64** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !43
  %7 = load i64*, i64** %data, align 8, !dbg !44
  %8 = bitcast i64* %7 to i8*, !dbg !44
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !44
  %9 = bitcast i64* %arraydecay to i8*, !dbg !44
  %10 = load i64*, i64** %data, align 8, !dbg !44
  %11 = bitcast i64* %10 to i8*, !dbg !44
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !44
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 800, i64 noundef %12) #5, !dbg !44
  %13 = load i64*, i64** %data, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i64, i64* %13, i64 0, !dbg !45
  %14 = load i64, i64* %arrayidx, align 8, !dbg !45
  call void @printLongLongLine(i64 noundef %14), !dbg !46
  ret void, !dbg !47
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* noundef null), !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 noundef %conv), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 400, align 16, !dbg !78
  %1 = bitcast i8* %0 to i64*, !dbg !79
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %2 = alloca i8, i64 800, align 16, !dbg !82
  %3 = bitcast i8* %2 to i64*, !dbg !83
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !81
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !84
  %cmp = icmp ne i32 %4, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !91
  store i64* %5, i64** %data, align 8, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !96
  %7 = load i64*, i64** %data, align 8, !dbg !97
  %8 = bitcast i64* %7 to i8*, !dbg !97
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !97
  %9 = bitcast i64* %arraydecay to i8*, !dbg !97
  %10 = load i64*, i64** %data, align 8, !dbg !97
  %11 = bitcast i64* %10 to i8*, !dbg !97
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !97
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 800, i64 noundef %12) #5, !dbg !97
  %13 = load i64*, i64** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i64, i64* %13, i64 0, !dbg !98
  %14 = load i64, i64* %arrayidx, align 8, !dbg !98
  call void @printLongLongLine(i64 noundef %14), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 400, align 16, !dbg !106
  %1 = bitcast i8* %0 to i64*, !dbg !107
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %2 = alloca i8, i64 800, align 16, !dbg !110
  %3 = bitcast i8* %2 to i64*, !dbg !111
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !109
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !112
  %cmp = icmp eq i32 %4, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !116
  store i64* %5, i64** %data, align 8, !dbg !118
  br label %if.end, !dbg !119

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !122
  %7 = load i64*, i64** %data, align 8, !dbg !123
  %8 = bitcast i64* %7 to i8*, !dbg !123
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !123
  %9 = bitcast i64* %arraydecay to i8*, !dbg !123
  %10 = load i64*, i64** %data, align 8, !dbg !123
  %11 = bitcast i64* %10 to i8*, !dbg !123
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !123
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 800, i64 noundef %12) #5, !dbg !123
  %13 = load i64*, i64** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i64, i64* %13, i64 0, !dbg !124
  %14 = load i64, i64* %arrayidx, align 8, !dbg !124
  call void @printLongLongLine(i64 noundef %14), !dbg !125
  ret void, !dbg !126
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !7}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 30, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!6 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"Homebrew clang version 14.0.6"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13_bad", scope: !16, file: !16, line: 21, type: !17, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 23, type: !3)
!21 = !DILocation(line: 23, column: 15, scope: !15)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 24, type: !3)
!23 = !DILocation(line: 24, column: 15, scope: !15)
!24 = !DILocation(line: 24, column: 42, scope: !15)
!25 = !DILocation(line: 24, column: 31, scope: !15)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 25, type: !3)
!27 = !DILocation(line: 25, column: 15, scope: !15)
!28 = !DILocation(line: 25, column: 43, scope: !15)
!29 = !DILocation(line: 25, column: 32, scope: !15)
!30 = !DILocation(line: 26, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 26, column: 8)
!32 = !DILocation(line: 26, column: 25, scope: !31)
!33 = !DILocation(line: 26, column: 8, scope: !15)
!34 = !DILocation(line: 30, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !16, line: 27, column: 5)
!36 = !DILocation(line: 30, column: 14, scope: !35)
!37 = !DILocation(line: 31, column: 5, scope: !35)
!38 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 33, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 32, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 33, column: 17, scope: !39)
!44 = !DILocation(line: 35, column: 9, scope: !39)
!45 = !DILocation(line: 36, column: 27, scope: !39)
!46 = !DILocation(line: 36, column: 9, scope: !39)
!47 = !DILocation(line: 38, column: 1, scope: !15)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_13_good", scope: !16, file: !16, line: 87, type: !17, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!49 = !DILocation(line: 89, column: 5, scope: !48)
!50 = !DILocation(line: 90, column: 5, scope: !48)
!51 = !DILocation(line: 91, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 103, type: !53, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !16, line: 103, type: !55)
!60 = !DILocation(line: 103, column: 14, scope: !52)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !16, line: 103, type: !56)
!62 = !DILocation(line: 103, column: 27, scope: !52)
!63 = !DILocation(line: 106, column: 22, scope: !52)
!64 = !DILocation(line: 106, column: 12, scope: !52)
!65 = !DILocation(line: 106, column: 5, scope: !52)
!66 = !DILocation(line: 108, column: 5, scope: !52)
!67 = !DILocation(line: 109, column: 5, scope: !52)
!68 = !DILocation(line: 110, column: 5, scope: !52)
!69 = !DILocation(line: 113, column: 5, scope: !52)
!70 = !DILocation(line: 114, column: 5, scope: !52)
!71 = !DILocation(line: 115, column: 5, scope: !52)
!72 = !DILocation(line: 117, column: 5, scope: !52)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 45, type: !17, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!74 = !DILocalVariable(name: "data", scope: !73, file: !16, line: 47, type: !3)
!75 = !DILocation(line: 47, column: 15, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !16, line: 48, type: !3)
!77 = !DILocation(line: 48, column: 15, scope: !73)
!78 = !DILocation(line: 48, column: 42, scope: !73)
!79 = !DILocation(line: 48, column: 31, scope: !73)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !16, line: 49, type: !3)
!81 = !DILocation(line: 49, column: 15, scope: !73)
!82 = !DILocation(line: 49, column: 43, scope: !73)
!83 = !DILocation(line: 49, column: 32, scope: !73)
!84 = !DILocation(line: 50, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !73, file: !16, line: 50, column: 8)
!86 = !DILocation(line: 50, column: 25, scope: !85)
!87 = !DILocation(line: 50, column: 8, scope: !73)
!88 = !DILocation(line: 53, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !16, line: 51, column: 5)
!90 = !DILocation(line: 54, column: 5, scope: !89)
!91 = !DILocation(line: 58, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !16, line: 56, column: 5)
!93 = !DILocation(line: 58, column: 14, scope: !92)
!94 = !DILocalVariable(name: "source", scope: !95, file: !16, line: 61, type: !40)
!95 = distinct !DILexicalBlock(scope: !73, file: !16, line: 60, column: 5)
!96 = !DILocation(line: 61, column: 17, scope: !95)
!97 = !DILocation(line: 63, column: 9, scope: !95)
!98 = !DILocation(line: 64, column: 27, scope: !95)
!99 = !DILocation(line: 64, column: 9, scope: !95)
!100 = !DILocation(line: 66, column: 1, scope: !73)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 69, type: !17, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!102 = !DILocalVariable(name: "data", scope: !101, file: !16, line: 71, type: !3)
!103 = !DILocation(line: 71, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !16, line: 72, type: !3)
!105 = !DILocation(line: 72, column: 15, scope: !101)
!106 = !DILocation(line: 72, column: 42, scope: !101)
!107 = !DILocation(line: 72, column: 31, scope: !101)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !16, line: 73, type: !3)
!109 = !DILocation(line: 73, column: 15, scope: !101)
!110 = !DILocation(line: 73, column: 43, scope: !101)
!111 = !DILocation(line: 73, column: 32, scope: !101)
!112 = !DILocation(line: 74, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !101, file: !16, line: 74, column: 8)
!114 = !DILocation(line: 74, column: 25, scope: !113)
!115 = !DILocation(line: 74, column: 8, scope: !101)
!116 = !DILocation(line: 77, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !16, line: 75, column: 5)
!118 = !DILocation(line: 77, column: 14, scope: !117)
!119 = !DILocation(line: 78, column: 5, scope: !117)
!120 = !DILocalVariable(name: "source", scope: !121, file: !16, line: 80, type: !40)
!121 = distinct !DILexicalBlock(scope: !101, file: !16, line: 79, column: 5)
!122 = !DILocation(line: 80, column: 17, scope: !121)
!123 = !DILocation(line: 82, column: 9, scope: !121)
!124 = !DILocation(line: 83, column: 27, scope: !121)
!125 = !DILocation(line: 83, column: 9, scope: !121)
!126 = !DILocation(line: 85, column: 1, scope: !101)
