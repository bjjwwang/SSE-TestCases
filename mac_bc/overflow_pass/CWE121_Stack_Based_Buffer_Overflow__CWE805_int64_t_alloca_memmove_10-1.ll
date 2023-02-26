; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_10-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_10-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalTrue = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_10_bad() #0 !dbg !15 {
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
  %4 = load i32, i32* @globalTrue, align 4, !dbg !30
  %tobool = icmp ne i32 %4, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !33
  store i64* %5, i64** %data, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !42
  %7 = load i64*, i64** %data, align 8, !dbg !43
  %8 = bitcast i64* %7 to i8*, !dbg !43
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !43
  %9 = bitcast i64* %arraydecay to i8*, !dbg !43
  %10 = load i64*, i64** %data, align 8, !dbg !43
  %11 = bitcast i64* %10 to i8*, !dbg !43
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !43
  %call = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %9, i64 noundef 800, i64 noundef %12) #5, !dbg !43
  %13 = load i64*, i64** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i64, i64* %13, i64 0, !dbg !44
  %14 = load i64, i64* %arrayidx, align 8, !dbg !44
  call void @printLongLongLine(i64 noundef %14), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_10_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_10_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_10_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 400, align 16, !dbg !77
  %1 = bitcast i8* %0 to i64*, !dbg !78
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %2 = alloca i8, i64 800, align 16, !dbg !81
  %3 = bitcast i8* %2 to i64*, !dbg !82
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !80
  %4 = load i32, i32* @globalFalse, align 4, !dbg !83
  %tobool = icmp ne i32 %4, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !89
  store i64* %5, i64** %data, align 8, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !94
  %7 = load i64*, i64** %data, align 8, !dbg !95
  %8 = bitcast i64* %7 to i8*, !dbg !95
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !95
  %9 = bitcast i64* %arraydecay to i8*, !dbg !95
  %10 = load i64*, i64** %data, align 8, !dbg !95
  %11 = bitcast i64* %10 to i8*, !dbg !95
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !95
  %call = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %9, i64 noundef 800, i64 noundef %12) #5, !dbg !95
  %13 = load i64*, i64** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i64, i64* %13, i64 0, !dbg !96
  %14 = load i64, i64* %arrayidx, align 8, !dbg !96
  call void @printLongLongLine(i64 noundef %14), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 400, align 16, !dbg !104
  %1 = bitcast i8* %0 to i64*, !dbg !105
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %2 = alloca i8, i64 800, align 16, !dbg !108
  %3 = bitcast i8* %2 to i64*, !dbg !109
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !107
  %4 = load i32, i32* @globalTrue, align 4, !dbg !110
  %tobool = icmp ne i32 %4, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !113
  store i64* %5, i64** %data, align 8, !dbg !115
  br label %if.end, !dbg !116

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !119
  %7 = load i64*, i64** %data, align 8, !dbg !120
  %8 = bitcast i64* %7 to i8*, !dbg !120
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !120
  %9 = bitcast i64* %arraydecay to i8*, !dbg !120
  %10 = load i64*, i64** %data, align 8, !dbg !120
  %11 = bitcast i64* %10 to i8*, !dbg !120
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !120
  %call = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %9, i64 noundef 800, i64 noundef %12) #5, !dbg !120
  %13 = load i64*, i64** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i64, i64* %13, i64 0, !dbg !121
  %14 = load i64, i64* %arrayidx, align 8, !dbg !121
  call void @printLongLongLine(i64 noundef %14), !dbg !122
  ret void, !dbg !123
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_10_bad", scope: !16, file: !16, line: 21, type: !17, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!32 = !DILocation(line: 26, column: 8, scope: !15)
!33 = !DILocation(line: 30, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !16, line: 27, column: 5)
!35 = !DILocation(line: 30, column: 14, scope: !34)
!36 = !DILocation(line: 31, column: 5, scope: !34)
!37 = !DILocalVariable(name: "source", scope: !38, file: !16, line: 33, type: !39)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 32, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 33, column: 17, scope: !38)
!43 = !DILocation(line: 35, column: 9, scope: !38)
!44 = !DILocation(line: 36, column: 27, scope: !38)
!45 = !DILocation(line: 36, column: 9, scope: !38)
!46 = !DILocation(line: 38, column: 1, scope: !15)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_10_good", scope: !16, file: !16, line: 87, type: !17, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!48 = !DILocation(line: 89, column: 5, scope: !47)
!49 = !DILocation(line: 90, column: 5, scope: !47)
!50 = !DILocation(line: 91, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 103, type: !52, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !16, line: 103, type: !54)
!59 = !DILocation(line: 103, column: 14, scope: !51)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !16, line: 103, type: !55)
!61 = !DILocation(line: 103, column: 27, scope: !51)
!62 = !DILocation(line: 106, column: 22, scope: !51)
!63 = !DILocation(line: 106, column: 12, scope: !51)
!64 = !DILocation(line: 106, column: 5, scope: !51)
!65 = !DILocation(line: 108, column: 5, scope: !51)
!66 = !DILocation(line: 109, column: 5, scope: !51)
!67 = !DILocation(line: 110, column: 5, scope: !51)
!68 = !DILocation(line: 113, column: 5, scope: !51)
!69 = !DILocation(line: 114, column: 5, scope: !51)
!70 = !DILocation(line: 115, column: 5, scope: !51)
!71 = !DILocation(line: 117, column: 5, scope: !51)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 45, type: !17, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!73 = !DILocalVariable(name: "data", scope: !72, file: !16, line: 47, type: !3)
!74 = !DILocation(line: 47, column: 15, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !16, line: 48, type: !3)
!76 = !DILocation(line: 48, column: 15, scope: !72)
!77 = !DILocation(line: 48, column: 42, scope: !72)
!78 = !DILocation(line: 48, column: 31, scope: !72)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !16, line: 49, type: !3)
!80 = !DILocation(line: 49, column: 15, scope: !72)
!81 = !DILocation(line: 49, column: 43, scope: !72)
!82 = !DILocation(line: 49, column: 32, scope: !72)
!83 = !DILocation(line: 50, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !72, file: !16, line: 50, column: 8)
!85 = !DILocation(line: 50, column: 8, scope: !72)
!86 = !DILocation(line: 53, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !16, line: 51, column: 5)
!88 = !DILocation(line: 54, column: 5, scope: !87)
!89 = !DILocation(line: 58, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !16, line: 56, column: 5)
!91 = !DILocation(line: 58, column: 14, scope: !90)
!92 = !DILocalVariable(name: "source", scope: !93, file: !16, line: 61, type: !39)
!93 = distinct !DILexicalBlock(scope: !72, file: !16, line: 60, column: 5)
!94 = !DILocation(line: 61, column: 17, scope: !93)
!95 = !DILocation(line: 63, column: 9, scope: !93)
!96 = !DILocation(line: 64, column: 27, scope: !93)
!97 = !DILocation(line: 64, column: 9, scope: !93)
!98 = !DILocation(line: 66, column: 1, scope: !72)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 69, type: !17, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!100 = !DILocalVariable(name: "data", scope: !99, file: !16, line: 71, type: !3)
!101 = !DILocation(line: 71, column: 15, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !16, line: 72, type: !3)
!103 = !DILocation(line: 72, column: 15, scope: !99)
!104 = !DILocation(line: 72, column: 42, scope: !99)
!105 = !DILocation(line: 72, column: 31, scope: !99)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !16, line: 73, type: !3)
!107 = !DILocation(line: 73, column: 15, scope: !99)
!108 = !DILocation(line: 73, column: 43, scope: !99)
!109 = !DILocation(line: 73, column: 32, scope: !99)
!110 = !DILocation(line: 74, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !99, file: !16, line: 74, column: 8)
!112 = !DILocation(line: 74, column: 8, scope: !99)
!113 = !DILocation(line: 77, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !16, line: 75, column: 5)
!115 = !DILocation(line: 77, column: 14, scope: !114)
!116 = !DILocation(line: 78, column: 5, scope: !114)
!117 = !DILocalVariable(name: "source", scope: !118, file: !16, line: 80, type: !39)
!118 = distinct !DILexicalBlock(scope: !99, file: !16, line: 79, column: 5)
!119 = !DILocation(line: 80, column: 17, scope: !118)
!120 = !DILocation(line: 82, column: 9, scope: !118)
!121 = !DILocation(line: 83, column: 27, scope: !118)
!122 = !DILocation(line: 83, column: 9, scope: !118)
!123 = !DILocation(line: 85, column: 1, scope: !99)
