; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !16, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i64* %arraydecay, i64** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !34, metadata !DIExpression()), !dbg !36
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !36
  %1 = load i64*, i64** %data, align 8, !dbg !37
  %2 = bitcast i64* %1 to i8*, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !37
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !37
  %4 = load i64*, i64** %data, align 8, !dbg !37
  %5 = bitcast i64* %4 to i8*, !dbg !37
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !37
  %call = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !37
  %7 = load i64*, i64** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !38
  %8 = load i64, i64* %arrayidx, align 8, !dbg !38
  call void @printLongLongLine(i64 noundef %8), !dbg !39
  ret void, !dbg !40
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_01_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* noundef null), !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 noundef %conv), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_01_good(), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_01_bad(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !72
  store i64* %arraydecay, i64** %data, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !74, metadata !DIExpression()), !dbg !76
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !76
  %1 = load i64*, i64** %data, align 8, !dbg !77
  %2 = bitcast i64* %1 to i8*, !dbg !77
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !77
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !77
  %4 = load i64*, i64** %data, align 8, !dbg !77
  %5 = bitcast i64* %4 to i8*, !dbg !77
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !77
  %call = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !77
  %7 = load i64*, i64** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !78
  %8 = load i64, i64* %arrayidx, align 8, !dbg !78
  call void @printLongLongLine(i64 noundef %8), !dbg !79
  ret void, !dbg !80
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_01_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = !DILocalVariable(name: "source", scope: !35, file: !12, line: 30, type: !28)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!36 = !DILocation(line: 30, column: 17, scope: !35)
!37 = !DILocation(line: 32, column: 9, scope: !35)
!38 = !DILocation(line: 33, column: 27, scope: !35)
!39 = !DILocation(line: 33, column: 9, scope: !35)
!40 = !DILocation(line: 35, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_01_good", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!42 = !DILocation(line: 59, column: 5, scope: !41)
!43 = !DILocation(line: 60, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 72, type: !45, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !12, line: 72, type: !47)
!52 = !DILocation(line: 72, column: 14, scope: !44)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !12, line: 72, type: !48)
!54 = !DILocation(line: 72, column: 27, scope: !44)
!55 = !DILocation(line: 75, column: 22, scope: !44)
!56 = !DILocation(line: 75, column: 12, scope: !44)
!57 = !DILocation(line: 75, column: 5, scope: !44)
!58 = !DILocation(line: 77, column: 5, scope: !44)
!59 = !DILocation(line: 78, column: 5, scope: !44)
!60 = !DILocation(line: 79, column: 5, scope: !44)
!61 = !DILocation(line: 82, column: 5, scope: !44)
!62 = !DILocation(line: 83, column: 5, scope: !44)
!63 = !DILocation(line: 84, column: 5, scope: !44)
!64 = !DILocation(line: 86, column: 5, scope: !44)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 42, type: !13, scopeLine: 43, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!66 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 44, type: !17)
!67 = !DILocation(line: 44, column: 15, scope: !65)
!68 = !DILocalVariable(name: "dataBadBuffer", scope: !65, file: !12, line: 45, type: !23)
!69 = !DILocation(line: 45, column: 13, scope: !65)
!70 = !DILocalVariable(name: "dataGoodBuffer", scope: !65, file: !12, line: 46, type: !28)
!71 = !DILocation(line: 46, column: 13, scope: !65)
!72 = !DILocation(line: 48, column: 12, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocalVariable(name: "source", scope: !75, file: !12, line: 50, type: !28)
!75 = distinct !DILexicalBlock(scope: !65, file: !12, line: 49, column: 5)
!76 = !DILocation(line: 50, column: 17, scope: !75)
!77 = !DILocation(line: 52, column: 9, scope: !75)
!78 = !DILocation(line: 53, column: 27, scope: !75)
!79 = !DILocation(line: 53, column: 9, scope: !75)
!80 = !DILocation(line: 55, column: 1, scope: !65)
