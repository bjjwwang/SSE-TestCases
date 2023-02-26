; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_03-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_03-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %dest = alloca i8*, align 8
  %src = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %a, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %b, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %b, align 4, !dbg !17
  br label %while.cond, !dbg !18

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %a, align 4, !dbg !19
  %cmp = icmp slt i32 %0, 10, !dbg !20
  br i1 %cmp, label %while.body, label %while.end, !dbg !18

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %a, align 4, !dbg !21
  %inc = add nsw i32 %1, 1, !dbg !21
  store i32 %inc, i32* %a, align 4, !dbg !21
  %2 = load i32, i32* %b, align 4, !dbg !23
  %add = add nsw i32 %2, 2, !dbg !24
  store i32 %add, i32* %b, align 4, !dbg !25
  br label %while.cond, !dbg !18, !llvm.loop !26

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !29, metadata !DIExpression()), !dbg !32
  %3 = load i32, i32* %a, align 4, !dbg !33
  %conv = sext i32 %3 to i64, !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 %conv) #6, !dbg !34
  store i8* %call, i8** %dest, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %src, metadata !35, metadata !DIExpression()), !dbg !36
  %4 = load i32, i32* %b, align 4, !dbg !37
  %conv1 = sext i32 %4 to i64, !dbg !37
  %call2 = call noalias align 16 i8* @malloc(i64 %conv1) #6, !dbg !38
  store i8* %call2, i8** %src, align 8, !dbg !36
  %5 = load i8*, i8** %src, align 8, !dbg !39
  %6 = load i32, i32* %b, align 4, !dbg !40
  %conv3 = sext i32 %6 to i64, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 1 %5, i8 97, i64 %conv3, i1 false), !dbg !41
  %7 = load i8*, i8** %src, align 8, !dbg !42
  %8 = load i32, i32* %b, align 4, !dbg !43
  %sub = sub nsw i32 %8, 1, !dbg !44
  %idxprom = sext i32 %sub to i64, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %idxprom, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !45
  %9 = load i8*, i8** %dest, align 8, !dbg !46
  %10 = load i8*, i8** %src, align 8, !dbg !47
  %11 = load i8*, i8** %src, align 8, !dbg !48
  %call4 = call i64 @strlen(i8* %11) #7, !dbg !49
  %add5 = add i64 %call4, 1, !dbg !50
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %9, i8* align 1 %10, i64 %add5, i1 false), !dbg !51
  %12 = load i32, i32* %retval, align 4, !dbg !52
  ret i32 %12, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_03-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_03-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 8, type: !13)
!15 = !DILocation(line: 8, column: 6, scope: !9)
!16 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 9, type: !13)
!17 = !DILocation(line: 9, column: 9, scope: !9)
!18 = !DILocation(line: 10, column: 5, scope: !9)
!19 = !DILocation(line: 10, column: 11, scope: !9)
!20 = !DILocation(line: 10, column: 13, scope: !9)
!21 = !DILocation(line: 11, column: 10, scope: !22)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 19)
!23 = !DILocation(line: 12, column: 13, scope: !22)
!24 = !DILocation(line: 12, column: 15, scope: !22)
!25 = !DILocation(line: 12, column: 11, scope: !22)
!26 = distinct !{!26, !18, !27, !28}
!27 = !DILocation(line: 13, column: 5, scope: !9)
!28 = !{!"llvm.loop.mustprogress"}
!29 = !DILocalVariable(name: "dest", scope: !9, file: !10, line: 15, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!32 = !DILocation(line: 15, column: 8, scope: !9)
!33 = !DILocation(line: 15, column: 22, scope: !9)
!34 = !DILocation(line: 15, column: 15, scope: !9)
!35 = !DILocalVariable(name: "src", scope: !9, file: !10, line: 16, type: !30)
!36 = !DILocation(line: 16, column: 8, scope: !9)
!37 = !DILocation(line: 16, column: 21, scope: !9)
!38 = !DILocation(line: 16, column: 14, scope: !9)
!39 = !DILocation(line: 17, column: 9, scope: !9)
!40 = !DILocation(line: 17, column: 19, scope: !9)
!41 = !DILocation(line: 17, column: 2, scope: !9)
!42 = !DILocation(line: 18, column: 2, scope: !9)
!43 = !DILocation(line: 18, column: 6, scope: !9)
!44 = !DILocation(line: 18, column: 8, scope: !9)
!45 = !DILocation(line: 18, column: 13, scope: !9)
!46 = !DILocation(line: 19, column: 10, scope: !9)
!47 = !DILocation(line: 19, column: 16, scope: !9)
!48 = !DILocation(line: 19, column: 28, scope: !9)
!49 = !DILocation(line: 19, column: 21, scope: !9)
!50 = !DILocation(line: 19, column: 33, scope: !9)
!51 = !DILocation(line: 19, column: 2, scope: !9)
!52 = !DILocation(line: 20, column: 1, scope: !9)
