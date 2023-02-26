; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  %0 = load i8*, i8** %data, align 8, !dbg !34
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !34
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 99, i64 noundef %2) #5, !dbg !34
  %3 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !38
  store i8* %4, i8** %unionFirst, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !40, metadata !DIExpression()), !dbg !42
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !43
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !43
  store i8* %5, i8** %data1, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !57, metadata !DIExpression()), !dbg !58
  %7 = load i8*, i8** %data1, align 8, !dbg !59
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !60
  store i64 %call2, i64* %dataLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !65
  %9 = load i64, i64* %dataLen, align 8, !dbg !67
  %cmp = icmp ult i64 %8, %9, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data1, align 8, !dbg !70
  %11 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !70
  %12 = load i8, i8* %arrayidx3, align 1, !dbg !70
  %13 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !74
  store i8 %12, i8* %arrayidx4, align 1, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %14, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !82
  store i8 0, i8* %arrayidx5, align 1, !dbg !83
  %15 = load i8*, i8** %data1, align 8, !dbg !84
  call void @printLine(i8* noundef %15), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* noundef null), !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 noundef %conv), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_good(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_bad(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType* %myUnion, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !116
  store i8* %arraydecay, i8** %data, align 8, !dbg !117
  %0 = load i8*, i8** %data, align 8, !dbg !118
  %1 = load i8*, i8** %data, align 8, !dbg !118
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !118
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !118
  %3 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %4 = load i8*, i8** %data, align 8, !dbg !121
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !122
  store i8* %4, i8** %unionFirst, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !124, metadata !DIExpression()), !dbg !126
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !127
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !127
  store i8* %5, i8** %data1, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !128, metadata !DIExpression()), !dbg !130
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !133, metadata !DIExpression()), !dbg !134
  %7 = load i8*, i8** %data1, align 8, !dbg !135
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !136
  store i64 %call2, i64* %dataLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !141
  %9 = load i64, i64* %dataLen, align 8, !dbg !143
  %cmp = icmp ult i64 %8, %9, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data1, align 8, !dbg !146
  %11 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !146
  %12 = load i8, i8* %arrayidx3, align 1, !dbg !146
  %13 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !150
  store i8 %12, i8* %arrayidx4, align 1, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %14, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !157
  store i8 0, i8* %arrayidx5, align 1, !dbg !158
  %15 = load i8*, i8** %data1, align 8, !dbg !159
  call void @printLine(i8* noundef %15), !dbg !160
  ret void, !dbg !161
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 31, column: 12, scope: !11)
!20 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_unionType", file: !12, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !12, line: 23, baseType: !17, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !12, line: 24, baseType: !17, size: 64)
!26 = !DILocation(line: 32, column: 79, scope: !11)
!27 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 33, column: 10, scope: !11)
!32 = !DILocation(line: 34, column: 12, scope: !11)
!33 = !DILocation(line: 34, column: 10, scope: !11)
!34 = !DILocation(line: 36, column: 5, scope: !11)
!35 = !DILocation(line: 37, column: 5, scope: !11)
!36 = !DILocation(line: 37, column: 17, scope: !11)
!37 = !DILocation(line: 38, column: 26, scope: !11)
!38 = !DILocation(line: 38, column: 13, scope: !11)
!39 = !DILocation(line: 38, column: 24, scope: !11)
!40 = !DILocalVariable(name: "data", scope: !41, file: !12, line: 40, type: !17)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!42 = !DILocation(line: 40, column: 16, scope: !41)
!43 = !DILocation(line: 40, column: 31, scope: !41)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !12, line: 42, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 41, column: 9)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 50)
!49 = !DILocation(line: 42, column: 18, scope: !45)
!50 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 43, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 31, baseType: !53)
!52 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !54, line: 94, baseType: !55)
!54 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!55 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 43, column: 20, scope: !45)
!57 = !DILocalVariable(name: "dataLen", scope: !45, file: !12, line: 43, type: !51)
!58 = !DILocation(line: 43, column: 23, scope: !45)
!59 = !DILocation(line: 44, column: 30, scope: !45)
!60 = !DILocation(line: 44, column: 23, scope: !45)
!61 = !DILocation(line: 44, column: 21, scope: !45)
!62 = !DILocation(line: 46, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !45, file: !12, line: 46, column: 13)
!64 = !DILocation(line: 46, column: 18, scope: !63)
!65 = !DILocation(line: 46, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !12, line: 46, column: 13)
!67 = !DILocation(line: 46, column: 29, scope: !66)
!68 = !DILocation(line: 46, column: 27, scope: !66)
!69 = !DILocation(line: 46, column: 13, scope: !63)
!70 = !DILocation(line: 48, column: 27, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !12, line: 47, column: 13)
!72 = !DILocation(line: 48, column: 32, scope: !71)
!73 = !DILocation(line: 48, column: 22, scope: !71)
!74 = !DILocation(line: 48, column: 17, scope: !71)
!75 = !DILocation(line: 48, column: 25, scope: !71)
!76 = !DILocation(line: 49, column: 13, scope: !71)
!77 = !DILocation(line: 46, column: 39, scope: !66)
!78 = !DILocation(line: 46, column: 13, scope: !66)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 49, column: 13, scope: !63)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 50, column: 13, scope: !45)
!83 = !DILocation(line: 50, column: 24, scope: !45)
!84 = !DILocation(line: 51, column: 23, scope: !45)
!85 = !DILocation(line: 51, column: 13, scope: !45)
!86 = !DILocation(line: 54, column: 1, scope: !11)
!87 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_34_good", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!88 = !DILocation(line: 90, column: 5, scope: !87)
!89 = !DILocation(line: 91, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !91, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!91 = !DISubroutineType(types: !92)
!92 = !{!93, !93, !94}
!93 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !12, line: 102, type: !93)
!96 = !DILocation(line: 102, column: 14, scope: !90)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !12, line: 102, type: !94)
!98 = !DILocation(line: 102, column: 27, scope: !90)
!99 = !DILocation(line: 105, column: 22, scope: !90)
!100 = !DILocation(line: 105, column: 12, scope: !90)
!101 = !DILocation(line: 105, column: 5, scope: !90)
!102 = !DILocation(line: 107, column: 5, scope: !90)
!103 = !DILocation(line: 108, column: 5, scope: !90)
!104 = !DILocation(line: 109, column: 5, scope: !90)
!105 = !DILocation(line: 112, column: 5, scope: !90)
!106 = !DILocation(line: 113, column: 5, scope: !90)
!107 = !DILocation(line: 114, column: 5, scope: !90)
!108 = !DILocation(line: 116, column: 5, scope: !90)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!110 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 63, type: !17)
!111 = !DILocation(line: 63, column: 12, scope: !109)
!112 = !DILocalVariable(name: "myUnion", scope: !109, file: !12, line: 64, type: !21)
!113 = !DILocation(line: 64, column: 79, scope: !109)
!114 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !12, line: 65, type: !28)
!115 = !DILocation(line: 65, column: 10, scope: !109)
!116 = !DILocation(line: 66, column: 12, scope: !109)
!117 = !DILocation(line: 66, column: 10, scope: !109)
!118 = !DILocation(line: 68, column: 5, scope: !109)
!119 = !DILocation(line: 69, column: 5, scope: !109)
!120 = !DILocation(line: 69, column: 16, scope: !109)
!121 = !DILocation(line: 70, column: 26, scope: !109)
!122 = !DILocation(line: 70, column: 13, scope: !109)
!123 = !DILocation(line: 70, column: 24, scope: !109)
!124 = !DILocalVariable(name: "data", scope: !125, file: !12, line: 72, type: !17)
!125 = distinct !DILexicalBlock(scope: !109, file: !12, line: 71, column: 5)
!126 = !DILocation(line: 72, column: 16, scope: !125)
!127 = !DILocation(line: 72, column: 31, scope: !125)
!128 = !DILocalVariable(name: "dest", scope: !129, file: !12, line: 74, type: !46)
!129 = distinct !DILexicalBlock(scope: !125, file: !12, line: 73, column: 9)
!130 = !DILocation(line: 74, column: 18, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !129, file: !12, line: 75, type: !51)
!132 = !DILocation(line: 75, column: 20, scope: !129)
!133 = !DILocalVariable(name: "dataLen", scope: !129, file: !12, line: 75, type: !51)
!134 = !DILocation(line: 75, column: 23, scope: !129)
!135 = !DILocation(line: 76, column: 30, scope: !129)
!136 = !DILocation(line: 76, column: 23, scope: !129)
!137 = !DILocation(line: 76, column: 21, scope: !129)
!138 = !DILocation(line: 78, column: 20, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !12, line: 78, column: 13)
!140 = !DILocation(line: 78, column: 18, scope: !139)
!141 = !DILocation(line: 78, column: 25, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !12, line: 78, column: 13)
!143 = !DILocation(line: 78, column: 29, scope: !142)
!144 = !DILocation(line: 78, column: 27, scope: !142)
!145 = !DILocation(line: 78, column: 13, scope: !139)
!146 = !DILocation(line: 80, column: 27, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !12, line: 79, column: 13)
!148 = !DILocation(line: 80, column: 32, scope: !147)
!149 = !DILocation(line: 80, column: 22, scope: !147)
!150 = !DILocation(line: 80, column: 17, scope: !147)
!151 = !DILocation(line: 80, column: 25, scope: !147)
!152 = !DILocation(line: 81, column: 13, scope: !147)
!153 = !DILocation(line: 78, column: 39, scope: !142)
!154 = !DILocation(line: 78, column: 13, scope: !142)
!155 = distinct !{!155, !145, !156, !81}
!156 = !DILocation(line: 81, column: 13, scope: !139)
!157 = !DILocation(line: 82, column: 13, scope: !129)
!158 = !DILocation(line: 82, column: 24, scope: !129)
!159 = !DILocation(line: 83, column: 23, scope: !129)
!160 = !DILocation(line: 83, column: 13, scope: !129)
!161 = !DILocation(line: 86, column: 1, scope: !109)
