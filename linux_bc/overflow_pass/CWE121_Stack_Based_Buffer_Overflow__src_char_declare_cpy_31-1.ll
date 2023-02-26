; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_31-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_31-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !30, metadata !DIExpression()), !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %2, i8** %dataCopy, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !34, metadata !DIExpression()), !dbg !35
  %3 = load i8*, i8** %dataCopy, align 8, !dbg !36
  store i8* %3, i8** %data1, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !42
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !43
  %5 = load i8*, i8** %data1, align 8, !dbg !44
  %call = call i8* @strcpy(i8* %arraydecay2, i8* %5) #5, !dbg !45
  %6 = load i8*, i8** %data1, align 8, !dbg !46
  call void @printLine(i8* %6), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_31_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #5, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #5, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_31_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_31_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !76
  store i8* %arraydecay, i8** %data, align 8, !dbg !77
  %0 = load i8*, i8** %data, align 8, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !79
  %1 = load i8*, i8** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !82, metadata !DIExpression()), !dbg !84
  %2 = load i8*, i8** %data, align 8, !dbg !85
  store i8* %2, i8** %dataCopy, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !86, metadata !DIExpression()), !dbg !87
  %3 = load i8*, i8** %dataCopy, align 8, !dbg !88
  store i8* %3, i8** %data1, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !91
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !92
  %5 = load i8*, i8** %data1, align 8, !dbg !93
  %call = call i8* @strcpy(i8* %arraydecay2, i8* %5) #5, !dbg !94
  %6 = load i8*, i8** %data1, align 8, !dbg !95
  call void @printLine(i8* %6), !dbg !96
  ret void, !dbg !97
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_31-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_31-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 12, scope: !11)
!25 = !DILocation(line: 27, column: 10, scope: !11)
!26 = !DILocation(line: 29, column: 12, scope: !11)
!27 = !DILocation(line: 29, column: 5, scope: !11)
!28 = !DILocation(line: 30, column: 5, scope: !11)
!29 = !DILocation(line: 30, column: 17, scope: !11)
!30 = !DILocalVariable(name: "dataCopy", scope: !31, file: !12, line: 32, type: !16)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!32 = !DILocation(line: 32, column: 16, scope: !31)
!33 = !DILocation(line: 32, column: 27, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !12, line: 33, type: !16)
!35 = !DILocation(line: 33, column: 16, scope: !31)
!36 = !DILocation(line: 33, column: 23, scope: !31)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !12, line: 34, column: 9)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 35, column: 18, scope: !38)
!43 = !DILocation(line: 37, column: 20, scope: !38)
!44 = !DILocation(line: 37, column: 26, scope: !38)
!45 = !DILocation(line: 37, column: 13, scope: !38)
!46 = !DILocation(line: 38, column: 23, scope: !38)
!47 = !DILocation(line: 38, column: 13, scope: !38)
!48 = !DILocation(line: 41, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_31_good", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 70, column: 5, scope: !49)
!51 = !DILocation(line: 71, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !53, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 82, type: !55)
!58 = !DILocation(line: 82, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 82, type: !56)
!60 = !DILocation(line: 82, column: 27, scope: !52)
!61 = !DILocation(line: 85, column: 22, scope: !52)
!62 = !DILocation(line: 85, column: 12, scope: !52)
!63 = !DILocation(line: 85, column: 5, scope: !52)
!64 = !DILocation(line: 87, column: 5, scope: !52)
!65 = !DILocation(line: 88, column: 5, scope: !52)
!66 = !DILocation(line: 89, column: 5, scope: !52)
!67 = !DILocation(line: 92, column: 5, scope: !52)
!68 = !DILocation(line: 93, column: 5, scope: !52)
!69 = !DILocation(line: 94, column: 5, scope: !52)
!70 = !DILocation(line: 96, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 50, type: !16)
!73 = !DILocation(line: 50, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !12, line: 51, type: !20)
!75 = !DILocation(line: 51, column: 10, scope: !71)
!76 = !DILocation(line: 52, column: 12, scope: !71)
!77 = !DILocation(line: 52, column: 10, scope: !71)
!78 = !DILocation(line: 54, column: 12, scope: !71)
!79 = !DILocation(line: 54, column: 5, scope: !71)
!80 = !DILocation(line: 55, column: 5, scope: !71)
!81 = !DILocation(line: 55, column: 16, scope: !71)
!82 = !DILocalVariable(name: "dataCopy", scope: !83, file: !12, line: 57, type: !16)
!83 = distinct !DILexicalBlock(scope: !71, file: !12, line: 56, column: 5)
!84 = !DILocation(line: 57, column: 16, scope: !83)
!85 = !DILocation(line: 57, column: 27, scope: !83)
!86 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 58, type: !16)
!87 = !DILocation(line: 58, column: 16, scope: !83)
!88 = !DILocation(line: 58, column: 23, scope: !83)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !12, line: 60, type: !39)
!90 = distinct !DILexicalBlock(scope: !83, file: !12, line: 59, column: 9)
!91 = !DILocation(line: 60, column: 18, scope: !90)
!92 = !DILocation(line: 62, column: 20, scope: !90)
!93 = !DILocation(line: 62, column: 26, scope: !90)
!94 = !DILocation(line: 62, column: 13, scope: !90)
!95 = !DILocation(line: 63, column: 23, scope: !90)
!96 = !DILocation(line: 63, column: 13, scope: !90)
!97 = !DILocation(line: 66, column: 1, scope: !71)
