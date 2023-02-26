; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !16, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i64* %arraydecay, i64** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !34, metadata !DIExpression()), !dbg !36
  %0 = load i64*, i64** %data, align 8, !dbg !37
  store i64* %0, i64** %dataCopy, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !38, metadata !DIExpression()), !dbg !39
  %1 = load i64*, i64** %dataCopy, align 8, !dbg !40
  store i64* %1, i64** %data1, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !41, metadata !DIExpression()), !dbg !43
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !43
  %3 = load i64*, i64** %data1, align 8, !dbg !44
  %4 = bitcast i64* %3 to i8*, !dbg !44
  %arraydecay2 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !44
  %5 = bitcast i64* %arraydecay2 to i8*, !dbg !44
  %6 = load i64*, i64** %data1, align 8, !dbg !44
  %7 = bitcast i64* %6 to i8*, !dbg !44
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !44
  %call = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #5, !dbg !44
  %9 = load i64*, i64** %data1, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !45
  %10 = load i64, i64* %arrayidx, align 8, !dbg !45
  call void @printLongLongLine(i64 noundef %10), !dbg !46
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !79
  store i64* %arraydecay, i64** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !81, metadata !DIExpression()), !dbg !83
  %0 = load i64*, i64** %data, align 8, !dbg !84
  store i64* %0, i64** %dataCopy, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !85, metadata !DIExpression()), !dbg !86
  %1 = load i64*, i64** %dataCopy, align 8, !dbg !87
  store i64* %1, i64** %data1, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !88, metadata !DIExpression()), !dbg !90
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !90
  %3 = load i64*, i64** %data1, align 8, !dbg !91
  %4 = bitcast i64* %3 to i8*, !dbg !91
  %arraydecay2 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !91
  %5 = bitcast i64* %arraydecay2 to i8*, !dbg !91
  %6 = load i64*, i64** %data1, align 8, !dbg !91
  %7 = bitcast i64* %6 to i8*, !dbg !91
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !91
  %call = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #5, !dbg !91
  %9 = load i64*, i64** %data1, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !92
  %10 = load i64, i64* %arrayidx, align 8, !dbg !92
  call void @printLongLongLine(i64 noundef %10), !dbg !93
  ret void, !dbg !94
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 30, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!20 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!21 = !DILocation(line: 23, column: 15, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 24, column: 13, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 25, column: 13, scope: !11)
!32 = !DILocation(line: 28, column: 12, scope: !11)
!33 = !DILocation(line: 28, column: 10, scope: !11)
!34 = !DILocalVariable(name: "dataCopy", scope: !35, file: !12, line: 30, type: !17)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!36 = !DILocation(line: 30, column: 19, scope: !35)
!37 = !DILocation(line: 30, column: 30, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !12, line: 31, type: !17)
!39 = !DILocation(line: 31, column: 19, scope: !35)
!40 = !DILocation(line: 31, column: 26, scope: !35)
!41 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 33, type: !28)
!42 = distinct !DILexicalBlock(scope: !35, file: !12, line: 32, column: 9)
!43 = !DILocation(line: 33, column: 21, scope: !42)
!44 = !DILocation(line: 35, column: 13, scope: !42)
!45 = !DILocation(line: 36, column: 31, scope: !42)
!46 = !DILocation(line: 36, column: 13, scope: !42)
!47 = !DILocation(line: 39, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31_good", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!49 = !DILocation(line: 67, column: 5, scope: !48)
!50 = !DILocation(line: 68, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 79, type: !52, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 79, type: !54)
!59 = !DILocation(line: 79, column: 14, scope: !51)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 79, type: !55)
!61 = !DILocation(line: 79, column: 27, scope: !51)
!62 = !DILocation(line: 82, column: 22, scope: !51)
!63 = !DILocation(line: 82, column: 12, scope: !51)
!64 = !DILocation(line: 82, column: 5, scope: !51)
!65 = !DILocation(line: 84, column: 5, scope: !51)
!66 = !DILocation(line: 85, column: 5, scope: !51)
!67 = !DILocation(line: 86, column: 5, scope: !51)
!68 = !DILocation(line: 89, column: 5, scope: !51)
!69 = !DILocation(line: 90, column: 5, scope: !51)
!70 = !DILocation(line: 91, column: 5, scope: !51)
!71 = !DILocation(line: 93, column: 5, scope: !51)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 48, type: !17)
!74 = !DILocation(line: 48, column: 15, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !12, line: 49, type: !23)
!76 = !DILocation(line: 49, column: 13, scope: !72)
!77 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !12, line: 50, type: !28)
!78 = !DILocation(line: 50, column: 13, scope: !72)
!79 = !DILocation(line: 52, column: 12, scope: !72)
!80 = !DILocation(line: 52, column: 10, scope: !72)
!81 = !DILocalVariable(name: "dataCopy", scope: !82, file: !12, line: 54, type: !17)
!82 = distinct !DILexicalBlock(scope: !72, file: !12, line: 53, column: 5)
!83 = !DILocation(line: 54, column: 19, scope: !82)
!84 = !DILocation(line: 54, column: 30, scope: !82)
!85 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 55, type: !17)
!86 = !DILocation(line: 55, column: 19, scope: !82)
!87 = !DILocation(line: 55, column: 26, scope: !82)
!88 = !DILocalVariable(name: "source", scope: !89, file: !12, line: 57, type: !28)
!89 = distinct !DILexicalBlock(scope: !82, file: !12, line: 56, column: 9)
!90 = !DILocation(line: 57, column: 21, scope: !89)
!91 = !DILocation(line: 59, column: 13, scope: !89)
!92 = !DILocation(line: 60, column: 31, scope: !89)
!93 = !DILocation(line: 60, column: 13, scope: !89)
!94 = !DILocation(line: 63, column: 1, scope: !72)
